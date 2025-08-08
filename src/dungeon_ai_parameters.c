// The weight of the regular attack in the weighted random when the AI is deciding which move to use, depending on how many other attacks the AI can currently use.
// Each index in the array corresponds to the number of attacks (0-4) the AI can use (i.e., is enabled and has PP remaining).
const s16 AI_REGULAR_ATTACK_WEIGHTS[5] = { 100, 20, 30, 40, 50 };